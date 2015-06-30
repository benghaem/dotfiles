import string
import urllib.request
import json
import datetime
import os

apiKey = open(str(os.environ['HOME']) + '/.todoist_api_key').read()

combo_str = str("api_token=") + str(apiKey) + str("&seq_no=0")

data_str = combo_str.encode('utf-8')

rawJson = urllib.request.urlopen('https://api.todoist.com/TodoistSync/v5.3/get', data=data_str)
data = rawJson.read().decode('utf-8')
# data = open('/home/ben/todoist.json').read()
todoist_json = json.loads(data)
today_date = datetime.date.today()
tom_date = today_date + datetime.timedelta(days=1)
overdue = []
overdue_date = []
today = []
tom = []

class todo_item(object):
	content = str
	date = datetime
	def __init__(self, content, date, project_id):
		self.content = content
		self.date = date
		self.project_id = project_id

def make_todo_item(content, date, project_id):
	item = todo_item(content, date, project_id)
	return item

def get_project_name(project_id):
	for project in todoist_json['Projects']:
		if project['id'] == project_id:
			return project['name']

for item in todoist_json['Items']:
	if str(item['due_date']) != "None":
		due_date = datetime.datetime.strptime(item['due_date'], '%a %d %b %Y %X')

		if due_date.date() < today_date:
			overdue.append(make_todo_item(item['content'], due_date.date(), item['project_id']))

		if due_date.date() == today_date:
			today.append(make_todo_item(item['content'], due_date.date(), item['project_id']))

		if due_date.date() == tom_date:
			tom.append(make_todo_item(item['content'], due_date.date(), item['project_id']))

# Reverse sort by date
overdue.sort(key=lambda r: r.date)

print ("")
print ("              Todo:")
if len(overdue) > 0:
	print ("Overdue:")
	print ("------------")
	for item in overdue:
		print(get_project_name(item.project_id), "|",item.content,"\nDue: ", item.date , "\n")

if len(today) > 0:
	print ("Today:")
	print ("------------")
	for item in today:
		print(get_project_name(item.project_id), "|",item.content)

	print("")

if len(tom) > 0:
	print ("Tomorrow:")
	print ("------------")
	for item in tom:
		print(get_project_name(item.project_id), "|",item.content)

if (len(overdue) == 0) and (len(today) == 0) and (len(tom) == 0):
	print ("No Tasks\nEnjoy Your Day")

print ("\n")