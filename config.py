# project/app/config.py


import logging
import os
from pydantic import AnyUrl, BaseSettings

log = logging.getLogger("uvicorn")


class Settings(BaseSettings):
    database_url: AnyUrl = os.environ.get("DATABASE_URL")


settings = Settings()