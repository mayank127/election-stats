/*Type of queries made by user from main page
*/


/*Queries If A Election is Selected with Year="xyz"*/

SELECT Election.Year,
Election.LokSabha,
Candidate.PersonName, 
Candidate.Votes,
Candidate.PartyName,
Candidate.ConstituencyName
Candidate.StateName,
Candidate.PersonDOB
Candidate.Results,
Person.Photo
FROM Election ,Candidate,Person WHERE Election.Year="xyz" 
AND Election.Year=Candidate.Year 
AND Person.Name=Candidate.PersonName  AND Person.DOB=Candidate.PersonDOB
ORDER BY Candidate.Year desc;
/*Parent Comments related to an Election*/
SELECT Discussion.ID, Discussion.Content,Discussion.EmailId FROM 
ElectionStarter , Discussion where ElectionStarter.Year="xyz" AND  ElectionStarter.ID=Discussion.ID;

/*Children comments on Starter Comment with ID ="Starter ID"*/
SELECT 
Discussion.Content ,
Discussion.EmailId ,
Users.Name 
FROM 
Discussion,
Comment,
Users
Where Comment.ParentDiscussionID="Starter ID"
AND Comment.ID=Discussion.ID 
AND Discussion.EmailId=Users.EmailId;

/*Insert For Start of New Discussion */

/******************************************************************************************/
/*Queries for  Person Field on Main Page*/

SELECT name FROM Person;

/*Queries If A Person is Selected with Name="xyz"*/

SELECT * FROM Person where name="xyz";

/*For All tuple in Above queries we create a buffer and give output by filtering with other attributes if
there are more than one tuples*/

/* selecting Active relatives of Given Political Person with name ="abc" ,DOB="dd-mm-yyyy"*/

(SELECT Name1 as ActiveRelativeName ,DOB1 as DOB FROM ActiveRelatives WHERE Name2="abc" 
AND	DOB2 ="dd-mm-yyyy") OR 
(SELECT Name2 as ActiveRelativeName ,DOB2 as DOB FROM ActiveRelatives WHERE Name1="abc" 
AND	DOB1 ="dd-mm-yyyy");

/*Selecting Information about elections Fought by Person if any in past with name ="abc" 
,DOB="dd-mm-yyyy"*/


SELECT * FROM Candidate WHERE PersonDOB="dd-mm-yyyy" AND PersonName="abc";


/*Parent Comments related to an Person*/
SELECT Discussion.ID, Discussion.Content,Discussion.EmailId FROM 
PersonStarter , Discussion where PersonStarter.PersonName="abc" AND 
PersonStarter.PersonDOB= "dd-mm-yyyy"
AND  PersonStarter.ID=Discussion.ID;

/*Children comments on Each Starter Comment with ID ="Starter ID"*/
SELECT 
Discussion.Content ,
Discussion.EmailId ,
Users.Name 
FROM 
Discussion,
Comment,
Users
Where Comment.ParentDiscussionID="Starter ID"
AND Comment.ID=Discussion.ID 
AND Discussion.EmailId=Users.EmailId;

/**************************************************************************************************/

/*Queries for  State Field on Main Page*/

SELECT * FROM
State where Name"Selected_State";


/* Selecting Info of all Candidate participated in any elections till now in selected state*/
SELECT 
Candidate.Year,
Candidate.PersonName, 
Candidate.Votes,
Candidate.PartyName,
Candidate.ConstituencyName ,
Candidate.StateName,
Candidate.PersonDOB
Candidate.Results,
Person.Photo
FROM Candidate ,Person WHERE 
Candidate.StateName="Selected_State"
AND	Candidate.PersonDOB=Person.DOB
AND	Candidate.PersonName=Person.Name
ORDER BY Candidate.Year desc;
;


/*Starter (Parent)Comments related to an State*/
SELECT Discussion.ID, Discussion.Content,Discussion.EmailId FROM 
StateStarter , Discussion where StateStarter.StateName="Selected_state" 
AND  StateStarter.ID=Discussion.ID;

/*Children comments on Each Starter Comment with ID ="Starter ID"*/
SELECT 
Discussion.Content ,
Discussion.EmailId ,
Users.Name 
FROM 
Discussion,
Comment,
Users
Where Comment.ParentDiscussionID="Starter ID"
AND Comment.ID=Discussion.ID 
AND Discussion.EmailId=Users.EmailId;

/**************************************************************************************/

/*Queries when Party Field is selected on Main Page*/

SELECT * FROM Party WHERE Name = "Selected_Party";

/*Selecting NotablePerson corresponding Selected_Party */

SELECT PersonName , PersonDOB FROM NotablePerson WHERE PartyName="Selected_Party";

/*Selecting Candidate info who were participated in any election in selected state*/

SELECT 
Candidate.Year,
Candidate.PersonName, 
Candidate.Votes,
Candidate.PartyName,
Candidate.ConstituencyName ,
Candidate.StateName,
Candidate.PersonDOB
Candidate.Results,
Person.Photo
FROM Candidate ,Person WHERE 
Candidate.PartyName="Selected_Party"
AND	Candidate.PersonDOB=Person.DOB
AND	Candidate.PersonName=Person.Name

ORDER BY Candidate.Year desc;

/*Starter (Parent)Comments related to  Party*/
SELECT Discussion.ID, Discussion.Content,Discussion.EmailId FROM 
PartyStarter , Discussion where PartyStarter.StateName="Selected_Party" 
AND  PartyStarter.ID=Discussion.ID;

/*Children comments on Each Starter Comment with ID ="Starter ID"*/
SELECT 
Discussion.Content ,
Discussion.EmailId ,
Users.Name 
FROM 
Discussion,
Comment,
Users
Where Comment.ParentDiscussionID="Starter ID"
AND Comment.ID=Discussion.ID 
AND Discussion.EmailId=Users.EmailId;


/**************************************************************************************/

/*Queries when a constituency is selected in a pre-selected State on MAin Page */

SELECT * FROM Constituency WHERE Name = "selected_constituency" 
AND	StateName="pre-selected_State";

/*Selecting Notable Person in selected_constituency*/

SELECT NotablePersonName ,NotablePersonDOB FROM NotablePersonConstituency WHERE 
Name="selected_constituency" AND StateName="pre-selected_State";

/*Selecting Candidate Participated in any election Held in selected constituency */

SELECT 
Candidate.Year,
Candidate.PersonName, 
Candidate.Votes,
Candidate.PartyName,
Candidate.ConstituencyName ,
Candidate.StateName,
Candidate.PersonDOB
Candidate.Results,
Person.Photo
FROM Candidate ,Person WHERE 
Candidate.ConstituencyName="selected_constituency"
AND	Candidate.StateName="pre-selected_State"
AND	Candidate.PersonDOB=Person.DOB
AND	Candidate.PersonName=Person.Name

ORDER BY Candidate.Year desc;

/*Starter (Parent) Comments related to an Seleted Constituency*/

SELECT Discussion.ID, Discussion.Content,Discussion.EmailId FROM 
ConstituencyStarter , Discussion where ConstituencyStarter.ConstituencyName="selected_constituency"
AND ConstituencyStarter.StateName="pre-selected_State" 
AND  ConstituencyStarter.ID=Discussion.ID;

/*Children comments on Each Starter Comment with ID ="Starter ID"*/
SELECT 
Discussion.Content ,
Discussion.EmailId ,
Users.Name 
FROM 
Discussion,
Comment,
Users
Where Comment.ParentDiscussionID="Starter ID"
AND Comment.ID=Discussion.ID 
AND Discussion.EmailId=Users.EmailId;


/***************************************************************************************/


/*Queries Related to Stats Page */
