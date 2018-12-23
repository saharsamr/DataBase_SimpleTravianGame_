def log_out(cnxn):

    cursor = cnxn.cursor()

    command = 'EXEC dbo.LogOut'
    cursor.execute(command)



