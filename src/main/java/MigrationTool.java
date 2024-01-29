import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.Statement;

public class MigrationTool {
    public static void main(String[] args) throws IOException {
        InputStream configInputStream = Resources.getResourceAsStream("mybatis-mybatis-config.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(configInputStream);

        try (SqlSession session = sqlSessionFactory.openSession()) {
            Blog blog = session.selectOne("org.mybatis.example.BlogMapper.selectBlog", 101);
        }
    }

    public void givenConnectionObject_whenSQLFile_thenExecute() throws Exception {

        String path = new File(ClassLoader.getSystemClassLoader().getResource("employee.sql").getFile()).toPath().toString();
        MyBatisScriptUtility.runScript(path, connection);

        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT COUNT(1) FROM employees");
        if (resultSet.next()) {
            int count = resultSet.getInt(1);
        }
    }
}
