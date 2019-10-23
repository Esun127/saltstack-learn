#!/usr/bin/env python
#coding:utf8
"""
    The top nth processes which take up CPU and MEMORY usage are avaliable through this module, addtionaly;
    the module can get the system load information.
"""

import os
import salt.utils


def cpu(n):
    """
    Return the top nth processes which take up the CPU usage for this minion
    CLI Example:
        salt '*' prank.cpu <n>
    """

    cmd = "ps aux | sed '1d' | sort -k3 -nr | head -%s" %str(n)
    output = __salt__['cmd.run_all'](cmd)
    res = []
    for line in output.splitlines():
        res.append(line)
    
    return res


def mem(n):
    """
    Return the top nth processes which take up the MEM usage for this minion
    CLI Example:
        salt '*' prank.mem <n>
    """
    
    cmd = "ps aux | sed '1d' | sort -k4 -nr | head -%s" %str(n)
    output = __salt__['cmd.run_all'](cmd)
    res = []
    for line in output.splitlines():
        res.append(line)
    
    return res



def load(n):
    """
    Return the top nth processes which take up the LOAD averages usage for this minion
    CLI Example:
    .. code-block:: bash
        salt '*' prank.load <n>
    """
    load_avg = os.getloadavg()
    res = {}
    res['1-min']=load_avg[0]
    res['5-min']=load_avg[1]
    res['15-min']=load_avg[2]
    return res

