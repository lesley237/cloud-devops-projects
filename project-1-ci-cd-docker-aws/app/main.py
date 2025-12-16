from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {"message": "CI/CD Pipeline with Docker and AWS is running 🚀"}

@app.get("/health")
def health():
    return {"status": "healthy"}
