package board.model;

import java.sql.SQLException;
import java.util.List;

public interface InterBoardDAO {

	 List<BoardVO> getQNAList() throws SQLException;
}
