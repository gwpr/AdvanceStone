import yaml
import json
import os.path
from collections import namedtuple
from robot.libraries.BuiltIn import BuiltIn

def load_screen(screen):
    name_file = '{}.yaml'.format(screen)
    
    path_screen = os.path.abspath(os.path.join(BuiltIn().get_variable_value("${SUITE_SOURCE}"), os.pardir))
    local_screen = "{}/screen/{}".format(path_screen, name_file)
    
    with open(local_screen) as file:
        return yaml.load(file, Loader=yaml.FullLoader)

def get_attributes(yaml_loaded):
    os = BuiltIn().get_variable_value('${ENV_OS}')
    os = os.lower()
    page = {}
    for key in yaml_loaded.keys():
        if yaml_loaded[key][os]['selector'] == 'text':
            page[key] = yaml_loaded[key][os]['value']
        else:
            if(yaml_loaded[key][os]['selector'] and yaml_loaded[key][os]['value']):
                page[key] = yaml_loaded[key][os]['selector'] + yaml_loaded[key][os]['value']
            else:
                page[key] = 'Seletor Vazio'
    return  page

def get_screen_object(screen):
    yaml_screen = load_screen(screen)
    screen_current = json.dumps(get_attributes(yaml_screen))

    try:
        screen_object = json.loads(screen_current, object_hook=lambda d: namedtuple('X', d.keys())(*d.values()))
        return screen_object
    except:
        print('Error ao converter o arquivo JSON')