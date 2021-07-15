import time
from apscheduler.schedulers.blocking import BlockingScheduler

sched = BlockingScheduler()

# 매일 12시 30분에 실행
@sched.scheduled_job('interval', seconds=5, id='test_1')
def job1():
    print(f'job1 : {time.strftime("%H:%M:%S")}')

# 매일 12시 30분에 실행
@sched.scheduled_job('cron', hour='12', minute='30', id='test_2')
def job2():
    print(f'job2 : {time.strftime("%H:%M:%S")}')

# 이런식으로 추가도 가능. 매분에 실행
sched.add_job(job2, 'cron', second='0', id="test_3")


print('sched before~')
sched.start()
print('sched after~') # 여긴 실행 안됨. Blocking 이기 때문에.