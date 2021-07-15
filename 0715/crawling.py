from apscheduler.schedulers.blocking import BlockingScheduler
import csv
import requests
import pandas as pd
import time

CSV_URL = 'http://raw.githubusercontent.com/jooeungen/coronaboard_kr/master/kr_regional_daily.csv'


def exec_interval():
    # 확진, 사망, 격리해제
    yesterday_data = {}
    yesterday_data['서울'] = [0, 0, 0]
    yesterday_data['부산'] = [0, 0, 0]
    yesterday_data['대구'] = [0, 0, 0]
    yesterday_data['인천'] = [0, 0, 0]
    yesterday_data['광주'] = [0, 0, 0]
    yesterday_data['대전'] = [0, 0, 0]
    yesterday_data['울산'] = [0, 0, 0]
    yesterday_data['세종'] = [0, 0, 0]
    yesterday_data['경기'] = [0, 0, 0]
    yesterday_data['강원'] = [0, 0, 0]
    yesterday_data['충북'] = [0, 0, 0]
    yesterday_data['충남'] = [0, 0, 0]
    yesterday_data['전북'] = [0, 0, 0]
    yesterday_data['전남'] = [0, 0, 0]
    yesterday_data['경북'] = [0, 0, 0]
    yesterday_data['경남'] = [0, 0, 0]
    yesterday_data['제주'] = [0, 0, 0]
    yesterday_data['검역'] = [0, 0, 0]

    flag = False
    csv_data = []

    with requests.Session() as s:
        download = s.get(CSV_URL)
        decoded_content = download.content.decode('utf-8')
        cr = csv.reader(decoded_content.splitlines(), delimiter=',')
        my_list = list(cr)
        for row in my_list:
            if row[0] == 'date':
                continue

            # 다음부터 과거 데이터의 차이만 다시 저장
            row[2] = int(row[2]) - int(yesterday_data[row[1]][0])
            row[3] = int(row[3]) - int(yesterday_data[row[1]][1])
            row[4] = int(row[4]) - int(yesterday_data[row[1]][2])

            # 누적 데이터 저장
            yesterday_data[row[1]][0] += row[2]
            yesterday_data[row[1]][1] += row[3]
            yesterday_data[row[1]][2] += row[4]

            csv_data.append(row)

    df = pd.DataFrame(csv_data)

    file_name = 'covid19_ko_' + \
        time.strftime('%Y-%m-%d', time.localtime(time.time())) + '.csv'
    df.to_csv(file_name, index=False, header=False, encoding='utf8')
    flag = True
    print('exec interval')
    return flag


def exec_cron():
    print('exec cron')


sched = BlockingScheduler()

# 예약방식 cron으로 설정, 11시 37분 마다 실행
sched.add_job(exec_interval, 'cron', hour='11', minute='37', id='my_job_id')
# 스케줄링 시작
sched.start()