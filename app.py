from flask import Flask
app = Flask(__name__)

import cx_Oracle
dsn = cx_Oracle.makedsn("oradb", 1521, "ORCLCDB")
conn = cx_Oracle.connect("system", "Oradoc_db1", dsn)

@app.route('/')
def index():
	return "Hello, Oracle DB version:" + conn.version + "\n", 200

# We only need this for local development.
if __name__ == '__main__':
    # using host to avoid getting "curl: (52) Empty reply from server" 
	# when calling outside of Docker
	app.run(host='0.0.0.0')
