from flask import Blueprint, jsonify, abort, request
import hashlib
import secrets
from ..models import User, db


bp = Blueprint('users', __name__, url_prefix='/users')


# decorator takes path and list of HTTP verbs
@bp.route('', methods=['GET'])
def index():
    users = User.query.all()  # ORM performs SELECT query
    result = []
    for t in users:
        result.append(t.serialize())  # build list of Tweets as dictionaries
    return jsonify(result)  # return JSON response


@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    t = User.query.get_or_404(id)
    return jsonify(t.serialize())


@bp.route('', methods=['POST'])
def create():
    # req body must contain user_id and content
    if 'username' not in request.json or 'password' not in request.json:
        return abort(400)
    # user with id of user_id must exist
#    User.query.get_or_404(request.json['username'])
    # construct Tweet
    t = User(
        username=request.json['username'],
        password=scramble(request.json['password'])
    )
    db.session.add(t)  # prepare CREATE statement
    db.session.commit()  # execute CREATE statement
    return jsonify(t.serialize())


@bp.route('/<int:id>', methods=['PUT'])
def update():
    # req body must contain user_id and content
    if 'username' not in request.json or 'password' not in request.json:
        return abort(400)
    # user with id of user_id must exist
#    User.query.get_or_404(request.json['username'])
    # construct Tweet
    t = User.query.get_or_404(id)
    if 'username' in request.json:
        t.username = request.json['username']
    if 'password' in request.json:
        t.password = request.json['password']

    db.session.commit()  # execute CREATE statement
    return jsonify(t.serialize())


def scramble(password: str):
    """Hash and salt the given password"""
    salt = secrets.token_hex(16)
    return hashlib.sha512((password + salt).encode('utf-8')).hexdigest()


@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    t = User.query.get_or_404(id)
    try:
        db.session.delete(t)  # prepare DELETE statement
        db.session.commit()  # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)
