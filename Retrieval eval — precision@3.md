Rubric:
a neighbor is relevant (1) if someone qualified for the achor job would apply to it

edge-case:
same title, diffrent company -> 1
same field, one level up or down -> 1
same sector, but differnt skill set -> 0
same company, different skills -> 0
staffing agency repost of a real job -> 1
jobs from dataannotation -> 0 
different sector, same skill set -> 1

precension@3 = 28/30 = 0.933

addenda ( rulings made during judging, 07/24):
1: duplicate of anchor(same postings, differen job_id ) -> 0. 
rationale: no user value in re-seeing the same job (row 0)
2: same company or subsidiary, *different* role -> judge on the same rubric
same company *AND* same role -> treated as duplicate, rule 0 (rows 12-14)

**worst match** row 27 (customer loan sales -> manager trainee).
semetic miss (misleading) > annoying duplicate
wrong match erodes trust in other results