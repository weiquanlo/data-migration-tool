import org.apache.ibatis.session.SqlSession;

public class test {
    try (
    SqlSession session = sqlSessionFactory.openSession()) {
        Blog blog = session.selectOne("org.mybatis.example.BlogMapper.selectBlog", 101);
    }
}
