# Read and merge data
train_data = read.table("train//X_train.txt",header=FALSE)
test_data = read.table("test//X_test.txt",header=FALSE)
data = rbind(test_data,train_data)

# Figure out what features we're going to use
features = read.table("features.txt",stringsAsFactors = FALSE)
means = grep("mean\\(\\)",features$V2)
stds = grep("std\\(\\)",features$V2)
feature_filter = c(means,stds)
feature_filter = sapply(feature_filter, function(x) {paste("V",x,sep="")},simplify=TRUE)

#Filter out unwanted cols
fdata = data[,(names(data) %in% feature_filter)]
cnames = colnames(fdata)

# Label the data
c = 1
for (n in colnames(fdata)) {
    num = as.numeric(substr(n,2,nchar(n)))
    colnames(fdata)[c] <- features$V2[num]
    c = c + 1
}

# Gather the subject and label factor data
train_subject = read.table("train//subject_train.txt",header=FALSE,stringsAsFactors = FALSE)
test_subject = read.table("test//subject_test.txt",header=FALSE,stringsAsFactors = FALSE)
subject = rbind(test_subject,train_subject)
fdata$subject = subject

train_labels = read.table("train//y_train.txt",header=FALSE,stringsAsFactors = FALSE)
test_labels = read.table("test//y_test.txt",header=FALSE,stringsAsFactors = FALSE)
labels = rbind(test_labels,train_labels)
fdata$activity_label = labels

# Clean label names
label_names = read.table("activity_labels.txt",stringsAsFactors = FALSE)
fdata$label = sapply(fdata$activity_label, function(x){label_names$V2[x]})

# Make some tidy data
tdata = subset(fdata, FALSE)
tdata = tdata[,!(names(tdata) %in% c("activity_label"))]
blank_row = tdata

for (subject in unique(fdata$subject)) {
    for (s2 in subject) {
print(s2)
        for (label in unique(fdata$label)) {
print(label) 
            ss = fdata[fdata$subject==s2 & fdata$label==label,]
            new_row = c(subject=s2, label=label)
            #new_row = blank_row
            #new_row['subject']=s2
            #new_row['label']=label
            for (cn in colnames(blank_row)) {
                if (!(cn %in% c("label","subject","activity_label"))) {
#print(cn)
                    #new_row[cn] = mean(ss[cn][[1]],na.rm=TRUE)
                    new_row = c(new_row, cn=mean(ss[cn][[1]],na.rm=TRUE))
                }
            }
#print(new_row)
last_row=new_row
            df = as.data.frame(as.list(last_row), stringsAsFactors = FALSE)
            tdata = rbind(tdata,df)
            #tdata = rbind(tdata,new_row)
        }
    }
}

c = 1
for (n in colnames(blank_row)) {
    if (c < 68) {
        colnames(tdata)[c+2] <- n
    }
    c = c + 1
}

for (i in (3:dim(tdata)[2])) {
  tdata[,i] = as.numeric(tdata[,i])
}

tdata
