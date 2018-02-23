library(formula.tools)
library(lmerTest)
m1 <- lmer(Informed.liking ~ Gender*Information +(1|Consumer), data=ham)
difflsmeans(m1, test.effs="Gender:Information")

traceback()

# 14: parse(text = x, keep.source = FALSE)
# 13: eval(parse(text = x, keep.source = FALSE)[[1L]])
# 12: formula(eval(parse(text = x, keep.source = FALSE)[[1L]]))
# 11: formula.character(object, env = baseenv())
# 10: formula(object, env = baseenv())
# 9: as.formula(new)
# 8: update.formula(fmodel, fmodel.red)
# 7: update(fmodel, fmodel.red)
# 6: update(fmodel, fmodel.red)
# 5: getFormula(obj, withRand = FALSE)
# 4: refitLM(rho$model)
# 3: calcLSMEANS(rho, alpha, test.effs, lsmeansORdiff, ddf)
# 2: lsmeans.calc(model, 0.05, test.effs = test.effs, lsmeansORdiff = FALSE, 
#        ddf)
# 1: difflsmeans(m1, test.effs = "Gender:Information")


# debug(formula)
debug(lmerTest:::getFormula)
difflsmeans(m1, test.effs="Gender:Information")

x = "NA Informed.liking ~ Gender * Information + (1 | Consumer) NA-( 1 | Consumer )"
parse(text = x, keep.source = FALSE)
