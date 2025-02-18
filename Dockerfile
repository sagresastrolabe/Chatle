FROM python:3.10-slim
ENV PYTHONUNBUFFERED=1 APP_HOME=/app
WORKDIR $APP_HOME
RUN useradd -m appuser && chown appuser:appuser /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY src/ .
USER appuser
HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD curl --fail http://localhost:8000/health || exit 1
EXPOSE 8000
ENTRYPOINT ["sh", "/app/entrypoint.sh"]
