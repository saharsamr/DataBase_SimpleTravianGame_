def add_user_duty(cnxn):
    duty_name = raw_input('Enter duty name:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.AddUserDuty ?'

    cursor.execute(command, (duty_name))
    cnxn.commit()

