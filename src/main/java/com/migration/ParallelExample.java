package com.migration;

import com.migration.task.ParallelTasks;

public class ParallelExample {
    public static void main(final String[] args) throws Exception
    {
        ParallelTasks tasks = new ParallelTasks();
        final Runnable waitOneSecond = new Runnable() {
            public void run()
            {
                try
                {
                    Thread.sleep(1000);
                }
                catch (InterruptedException e)
                {
                }
            }
        };
        tasks.add(waitOneSecond);
        tasks.add(waitOneSecond);
        tasks.add(waitOneSecond);
        tasks.add(waitOneSecond);
        final long start = System.currentTimeMillis();
        tasks.go();
        System.err.println(System.currentTimeMillis() - start);
    }
}
