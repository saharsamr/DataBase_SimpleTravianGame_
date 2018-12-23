def change_user_duty(cnxn):
    username = raw_input('Enter username:')
    duty_name = raw_input('Enter duty name:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.SetUserDuty ?, ?'

    cursor.execute(command, (username, duty_name))
    cnxn.commit()

    command = 'SELECT * FROM dbo.CheckUserDuty(?, ?)'
    cursor.execute(command, (username, duty_name))

    if len(cursor.fetchall()) == 0:
        print 'Not a valid statement'
    else:
        print 'User duty updated successfully'


