package com.migration.processor;


import com.migration.model.Processor;

public class InsertPassengerProcessor implements Processor{

    @Override
    public boolean invoke() {
        return false;
    }

    @Override
    public void rollback() {

    }

}
