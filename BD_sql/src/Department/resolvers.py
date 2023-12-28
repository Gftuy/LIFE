from .models import OutputGroup, ImputGroup, NewId
from database.db_manager import base_manager

ID = 0
NAME = 1


def get_groups():
    res = base_manager.execute("SELECT id, name FROM groups", many=True)
    groups = []
    for group in res['data']:
        groups.append(OutputGroup(id=group[ID], name=group[NAME]))
    return groups


def get_group(group_id: int):
    res = base_manager.execute("SELECT id, name FROM groups WHERE id = ?",
                               args=(group_id,), many=False)
    print(res)
    return OutputGroup(id=res["id"], name=res["name"])


def add_new_group(new_group: ImputGroup, ):
    res = base_manager.execute("INSERT INTO groups(name) "
                               "VALUES (?) "
                               "RETURNING id", args=(new_group.name,))
    print(res)
    return NewId(code=res['code'], id=res['data'][0][0])


def update_group(group_id: int, group: ImputGroup):
    res = base_manager.execute("UPDATE groups SET name = ? WHERE id = ?",
                               args=(group.name, group_id,))
    return NewId(code=res['code'], id=group_id)


def delete_current_group(group_id: int):
    res = base_manager.execute("DELETE FROM groups WHERE id = ?",
                               args=(group_id,))
    return NewId(code=res['code'], id=group_id)