from locust import HttpLocust, TaskSet, task


class Task(TaskSet):
    @task
    def index(self):
        self.client.get("/")


class WebsiteUser(HttpLocust):
    task_set = Task
    min_wait = 2000
    max_wait = 3000
