def change_user_duty(cnxn):
    username = raw_input('Enter username:') #TODO: ye shakhse khas manteqan bayad betune war ro shoru kone!
    duty_name = raw_input('Enter duty name:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.SetUserDuty ?, ?'

    cursor.execute(command, (username, duty_name))
    cnxn.commit()

