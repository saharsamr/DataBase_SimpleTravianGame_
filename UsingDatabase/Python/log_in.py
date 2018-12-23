def log_in(cnxn):
    username = raw_input('Enter username:')
    password = raw_input('Enter password:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.LogIn ?, ?'

    cursor.execute(command, (username, password))
    cnxn.commit()

    return username

