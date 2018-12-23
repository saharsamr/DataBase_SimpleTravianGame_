def start_war(doer, cnxn):
    starter = raw_input('Enter starter:')
    threatened = raw_input('Enter treathended:')

    cursor = cnxn.cursor()

    command = 'EXEC dbo.StartWar ?, ?, ?'

    cursor.execute(command, (starter, threatened, doer))
    cnxn.commit()

