def add_user_to_clan(cnxn):
    username = raw_input('Enter target username:')
    role_name = raw_input('Enter target role name:')
    clan_name = raw_input('Enter clan name:')
    doer = raw_input('Enter doer username:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.AddUserToClan ?, ?, ?, ?'

    cursor.execute(command, (username, role_name, clan_name, doer))
    cnxn.commit()

