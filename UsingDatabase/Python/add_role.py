def add_role(cnxn):
    role_name = raw_input('Enter role name:')
    uniqueness = raw_input('Enter 1 if it is unique, 0 otherwise:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.AddRole ?, ?'

    cursor.execute(command, (role_name, uniqueness))
    cnxn.commit()

