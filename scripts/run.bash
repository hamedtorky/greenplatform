export DB_URL="postgres"
export SERVER_IP="127.0.0.1"

echo ${WORK_DIR:-"/code"} ${WORKER_COUNT:-"2"} ${BIND_ADDRESS:-":8000"}
cd ${WORK_DIR:-"/code"}
python manage.py collectstatic -c --noinput
gunicorn greenPlatform.wsgi -w ${WORKER_COUNT:-"2"} -b ${BIND_ADDRESS:-":8000"}