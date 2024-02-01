package com.migration;

import com.migration.util.CmdRunner;

import java.io.IOException;

public class CmdExample {
    public static void main(String[] args) {
        // Path to your T-SQL script
        String scriptPath = "C:\\Users\\WeiQuan\\Desktop\\SimplrWorkplace\\data-migration-tool\\src\\main\\resources\\script.sql";

        // Command to execute the script using sqlcmd
        // Replace [ServerName] and [Database] with your server and database details
        String command = "sqlcmd -S DESKTOP-ON3AMQR\\SQLEXPRESS -d migration_test -i " + scriptPath;
        String batCmd = "C:\\Users\\WeiQuan\\Desktop\\SimplrWorkplace\\data-migration-tool\\src\\main\\resources\\scripts\\SqlRunner.bat";
        try {
            CmdRunner.run(command);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
