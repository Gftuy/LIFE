from fastapi import FastAPI
import uvicorn
from fastapi.responses import RedirectResponse
from database.db_manager import base_manager
from employees import router as employees_router
from students import router as student_router
from users import router as users_router
from settings import SCRIPTS_TABLES_PATH, SCRIPTS_RIMARY_DATA_PATH

app = FastAPI()

app.include_router(users_router, prefix='/users')
app.include_router(group_router, prefix="/groups")
app.include_router(student_router, prefix='/students')



@app.get('/')
def root():
    return RedirectResponse('/docs')


if __name__ == '__main__':
    if not base_manager.check_base():
        base_manager.create_base(SCRIPTS_TABLES_PATH, SCRIPTS_RIMARY_DATA_PATH)
    uvicorn.run(app="start_server:app", host="0.0.0.0",  port=8000, reload=True)