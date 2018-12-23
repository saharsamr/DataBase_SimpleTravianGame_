def add_user(cnxn):
    username = raw_input('Enter username:')
    pass_hash = raw_input('Enter pass:')
    email = raw_input('Enter email:')
    duty_name = raw_input('Enter duty:')

    try:
        cursor = cnxn.cursor()

        command = 'SELECT * FROM dbo.GetAUserInfo( ? )'
        cursor.execute(command, (username))

        if len(cursor.fetchall()) == 0:

            command = 'EXEC dbo.AddUser ?, ?, ?, ?'

            cursor.execute(command, (username, pass_hash, email, duty_name))
            cnxn.commit()

            command = 'SELECT * FROM dbo.GetAUserInfo( ? )'
            cursor.execute(command, (username))

            if len(cursor.fetchall()) != 1:
                print 'Not a valid statement'
            else:
                print 'User added'
        else:
            print 'This user already exists'
    except:
        print 'Duplicate user'

