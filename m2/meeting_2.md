<div class="header" style="margin-top:0 px;font-size:60%;">ITASUR: Second Meeting</div>

Introduction to applied statistics using R
========================================================
author: David Sichinava, Ph.D.
date: October 14, 2022
autosize: true
transition: none
css: css/style.css
font-family: 'BPG_upper'
<span style="font-weight:bold; font-family:BPG_upper;">Second Meeting</span>




Today's plan
========================================================
incremental: true


- Delve into R


Recap: vectors in R
========================================================


```r
my_list<-c("I'm the first", "I'm the second", "I'm the third")

my_list[1] ### Access first element

my_list[2] ### Access second element

my_list[3] ### Access third element
```

Atomic objects:
========================================================
R uses different types of objects to store data. 


```r
logical <- c(TRUE, FALSE, T, F)
integer <- c(1L, 4L, 8L, 0L)
double <- c(1, 3.6, 90, 4)
character <- c("a", "b", "სამი", "four")
```

Atomic objects:
========================================================
You can check object types as follows:


```r
typeof(logical)

typeof(integer)

typeof(double)

typeof(character)
```



Lists:
========================================================
In practice, atomic objects are usually combined into lists. Throughout this class, we'll be mostly using lists and their different reincarnations.


```r
simple_list<-list(TRUE, FALSE, T, F)
i_can_combine_other_lists <- list(c("a", "b"), c("იყო არაბეთს როსტევან"), c(1L, 4L, 8L, 0L), 98)
i_can_be_mulitidimensional <- list(list(c("a", "b"), 7), c("რომელმან შექმნა სამყარო"))
```

Attributes:
========================================================
Objects in R have `attributes`. What they do is quite self-explanatory - they store information about particular object, such as:

| __Attribute__ | __Description__ |
|--------------|--------------------------------------------------------------------------------|
|	`class`		| Object type|
|	`comment` 	| Comment to the object|
|	`dim`		| Dimensions (could be number of rows and comments) |
|	`dimnames` | Names of the object's dimensions|
|	`names`	| Object name |
|	`row.names` | (if you have a table-type object) names of rows |
|	`tsp`		| (if you have time series data) dates and times |
|	`levels`	| Levels for factors. Simply speaking, textual definitions of values (for instance, 1 corresponds to Apples, 2 corresponds to Organges) |

Attributes:
========================================================

```r
names(simple_list)

class(i_can_combine_other_lists)

dim(i_can_combine_other_lists)
```

Attributes:
========================================================
You can have custom attributes too:


```r
attr(simple_list, "Attribute") <- "Custom attribute"

attributes(x)
```


Factor:
========================================================
Those who are familiar with SPSS or STATA, might remember that your variables have "labels," that is, alphanumeric definitions of what numbers mean. Factors serve the same purpose in R. Here's how you can construct factors:


```r
eyes <- c(1, 2, 2, 3, 2, 1, 4)

eyes <- factor(eyes, levels = c(1, 2, 3, 4), labels = c("Brown", "Green", "Blue", "Grey"))
```

Arrays, matrices, data frames
========================================================

<img src="img/bullets.gif" alt="Drawing" style="width: 600px; display: block; margin-left: auto; margin-right: auto; margin-top: 40px;"/>

Arrays, matrices, data frames
========================================================
- Most data that we use in practice has tabular format, that is, columns and rows
- Columns usually correspond to _variables_, while rows are _observations_ or cases, for instance, our class members can be observations, while their characteristics (height, gender, age) can be understood as variables
- Data frames are the most widespread data format that we will encounter throughout this class.

Data frames
========================================================
- Data frames have rectangular structure (basically, they are matrices - hello, calculus 101!)
- We can construct data frames manually or simply read them as external files.

```r
regions <- data.frame(
   id = c (1:11), 
   region_name = c("SZS","RLS","IME","GUR","ADJ", "SJS", "SHK", "KVK", "MTM", "TBS", "KAK"),
   value_added = c(1807.4, NA, 2685.2, 584.4, 2039.7, 724.6, 1485.21, 2162.9, NA, 12147.1, 1459.1),
   stringsAsFactors = FALSE
	)

print(df)
```


External files
========================================================
- In R, you can read external files, such as .csv (comma separated files - essentially text files), and datasets in SPSS, STATA, and Excel formats
- For simplicity, let's first focus on comma-separated values


External files
========================================================
- This dataset lists the members of the 1919 Parliament of Georgia (or, damp'udznebeli k'reba)


```r
mps <- read.csv("parliament.csv")
```


What's in the dataset?
========================================================


```r
summary(mps)

View(mps)

names(mps)
```

Edit our dataset
========================================================
Turn gender variable into a factor


```r
mps$gender ## Dollar sign allows us to access any column in our dataset

mps$gender <- factor(mps$gender, levels=c(1, 2), labels=c("Male", "Female"))
table(mps$gender) ## how many male and female MPs were there?
```



Subset observations
========================================================
Calculate how many Georgian female MPs were in the dataset


```r
table(mps$gender[mps$ethnicity == 1, ]) ## how many male and female MPs were there?
```

Calculate proportions
========================================================
What is the proportion of male and female MPs?


```r
prop.table(table(mps$gender)) ## how many male and female MPs were there?
```

Descriptive statistics
========================================================
What is the average age of an MP at elections?


```r
mean(mps$age)
```


