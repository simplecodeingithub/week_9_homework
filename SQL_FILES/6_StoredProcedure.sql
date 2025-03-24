USE librarydb;

DELIMITER //

CREATE PROCEDURE SendNotifications( IN p_UserID INT, 
IN p_NotificationType VARCHAR(50), 
IN p_Message TEXT)

BEGIN    -- Create a notifications table if it doesn't exist    
CREATE TABLE 
IF NOT EXISTS Notifications (
	NotificationID INT PRIMARY KEY AUTO_INCREMENT,        
	UserID INT,        
    NotificationType VARCHAR(50),        
    Message TEXT,        
    NotificationDate DATETIME DEFAULT CURRENT_TIMESTAMP,        
    IsRead BOOLEAN DEFAULT FALSE,        
    FOREIGN KEY (UserID) REFERENCES LibraryUsers(UserID)); -- Insert notification    
    
    INSERT INTO Notifications (UserID, NotificationType, Message)    
    VALUES (p_UserID, p_NotificationType, p_Message);
    
    END //
    
DELIMITER ;


DELIMITER //
 
CREATE PROCEDURE Borrowing_Books(

    IN p_BookID INT,
	IN p_UserID INT
)

BEGIN

    DECLARE available_count INT;
 
    -- Check if the book is available

    SELECT CopiesAvailable INTO available_count

    FROM Books

    WHERE BookID = p_BookID

    FOR UPDATE;  -- Locks the row to prevent race conditions
 
    IF available_count > 0 THEN

        -- Insert the borrow record into the Borrow_Log table

        INSERT INTO BorrowingBooks (BookID, UserID, BorrowDate)

        VALUES (p_BookID, p_UserID, NOW());
 
        -- Decrease the available book count atomically

        UPDATE Books

        SET CopiesAvailable = CopiesAvailable - 1

        WHERE BookID = p_BookID;
 
    ELSE

        -- Raise an error if no copies are available

        SIGNAL SQLSTATE '45000'

        SET MESSAGE_TEXT = 'No available copies for this book';

    END IF;

END//
 
DELIMITER ;

DELIMITER //
 
CREATE PROCEDURE PayFine(
    IN p_FineID INT
)
BEGIN
    -- Check if the fine exists and is unpaid
    IF EXISTS (
        SELECT 1 FROM FinesTable
        WHERE FineId = p_FineID AND FineStatus = 'unpaid' and overdue_days>=1
    ) THEN
        UPDATE FinesTable
        SET FineStatus = 'paid',
            PaymentDate = CURRENT_DATE
        WHERE FineId = p_FineID;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Fine is already paid or does not exist.';
    END IF;
END;
//
 
DELIMITER ;


 

