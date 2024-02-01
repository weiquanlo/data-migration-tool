package com.migration.model;

public interface Processor{

/*    return False to abort whole pipeline
*
*
* */
    boolean invoke();

    void rollback();
}
