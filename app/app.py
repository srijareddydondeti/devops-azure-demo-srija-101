from flask import Flask, jsonify
import os
app = Flask(__name__)

@app.route("/")
def hello():
    return jsonify(message="Hello from DevOps demo", version=os.getenv("APP_VERSION","v1"))

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
