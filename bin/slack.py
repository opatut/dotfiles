import requests, os, json

def fetch(function, method='get', **params):
    token = os.environ['SLACK_TOKEN']
    r = getattr(requests, method)('https://slack.com/api/' + function, params=dict(token=token, **params))
    r = r.json()
    if not ('ok' in r and r['ok']):
        raise Exception(r['error'])
    return r

def set_slack_status(emoji, text):
    fetch(
        'users.profile.set', 
        method='post', 
        profile=json.dumps(dict(status_text=text, status_emoji=emoji)),
    )

def set_slack_snooze(num_minutes=20):
    fetch(
        'dnd.setSnooze', 
        method='get', 
        num_minutes=num_minutes,
    )
