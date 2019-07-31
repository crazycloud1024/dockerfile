import random
from locust import HttpLocust, TaskSet, task


class Task(TaskSet):

    #     def on_start(self):
    #         self.index()
    #         self.login()

    #     def on_stop(self):
    #         self.logot()

    #     def login(self):
    #         self.client.get("/info")

    #     def logot(self):
    #         self.client.post("/logot", {"username": "test", "password": "test"})

    @task
    def index(self):
        self.client.get("/")

#     @task(1)
#     def info(self):
#         self.client.get("/info")


class WebsiteUser(HttpLocust):
    task_set = Task
    def wait_function(self): return random.expovariate(1)*1000
#     min_wait = 2000
#     max_wait = 4000
