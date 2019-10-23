#!py
def run():
    exmaple={}
    exmaple['/tmp/test'] = {
        'file.managed': [
        {'source': 'salt://test'},
        {'mode': '644'},
        {'user': 'root'},
        {'template': 'jinja'},
        {'group': 'root'},
        {'context': {
            'a': __grains__.get('os', 'testos'),
            'b': __pillar__.get('b', 'testa'),
            },
        },
        ]
    }
    return exmaple





