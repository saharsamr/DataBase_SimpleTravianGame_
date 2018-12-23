def start_war(cnxn):
    starter = raw_input('Enter starter:')
    threatened = raw_input('Enter treathended:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.StartWar ?, ? '

    cursor.execute(command, (starter, threatened))
    cnxn.commit()

