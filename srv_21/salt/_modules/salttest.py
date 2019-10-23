import salt.utils

def run(cmd):
    return __salt__['cmd.run_all'](cmd, python_shell=False)
    
if __name__ == '__main__':
    print run('date')
