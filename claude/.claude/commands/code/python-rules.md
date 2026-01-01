- use fastapi/uvicorn for the web framework, and make sure to reference FastAPI tips from https://github.com/Kludex/fastapi-tips
- add middleware to whitelist specific IPs as well
- use a pyproject.toml instead of requirements.txt
- use ruff for linting and fixing
- use pyright for type checking
- use vulture to analyze and find deadcode
- use sqlc to compile sql into type safe python code
- use pydantic where possible or dataclasses to hold groups of variables

for example

```python
from pydantic import SecretStr

class AppSettings(BaseModel):
    whitelist_ips_enabled: bool = os.getenv("WHITELIST_IPS_ENABLED")
    some_api_key: SecretStr = os.getenv("SOME_API_KEY")
```

- ensure to use the following project structure:
  - try to use modules where possible,
    for example if we had our code inside of `app/` , try not to create `utils.py` but instead create a `utils` module and create env.py for handling all environment variable matters
  - data types, enums, etc. defined inside of `model.py` instead of being scattered randomly.
  - everything related to other external APIs go inside of `app/api/api_name`
  - everything related to our own API, middleware, authentication, routes, keep inside of a folder called `app/api`
  - when naming data types related to an API request, suffix the data model / dataclass with `Request`, and for API response suffix it with `Response`
