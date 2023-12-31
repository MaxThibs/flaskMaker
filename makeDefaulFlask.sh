mkdir appWorkingDirectory
cd appWorkingDirectory
printf "from flask import Flask\napp = Flask(__name__)\n\n@app.route('/')\ndef hello_geek():\n\treturn '<h1>Hello from Flask & Docker</h2>'\nif __name__ == '__main__':\n\tapp.run(debug=True)" >> app.py
printf "# syntax=docker/dockerfile:1\nFROM python:3.8-slim-buster\n\nWORKDIR /python-docker\n\nCOPY requirements.txt requirements.txt\nRUN pip3 install -r requirements.txt\n\nCOPY . .\n\nCMD [ \"python3\", \"-m\" , \"flask\", \"run\", \"--host=0.0.0.0\"]" >> Dockerfile
cd ..
pip3 freeze > appWorkingDirectory/requirements.txt
printf "DONE: You now have some of the starter pieces to run a python flask app.\n"