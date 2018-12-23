def is_loged_in(username, cnxn):

    cursor = cnxn.cursor()

    command = 'SELECT * FROM dbo.IsLogIn(?)'

    cursor.execute(command, (username))

    if len(cursor.fetchall()) == 0:
        return False
    else:
        return True



