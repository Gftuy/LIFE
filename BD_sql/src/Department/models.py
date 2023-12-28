from pydantic import BaseModel
from typing import Optional


class ImputGroup(BaseModel):
    name: str


class OutputGroup(BaseModel):
    id: int
    name: str


class NewId(BaseModel):
    code: int
    id: int