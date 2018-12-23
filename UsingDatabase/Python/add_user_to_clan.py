def add_user_to_clan(doer, cnxn):
    username = raw_input('Enter target username:')
    role_name = raw_input('Enter target role name:')
    clan_name = raw_input('Enter clan name:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.AddUserToClan ?, ?, ?, ?'

    cursor.execute(command, (username, role_name, clan_name, doer))
    cnxn.commit()

    command = 'SELECT * FROM dbo.CheckAUserRoleInClan(?, ?, ?)'
    cursor.execute(command, (username, role_name, clan_name))

    if len(cursor.fetchall()) != 1:
        print 'Invalid statement'
    else:
        print 'User added to clan successfully'

