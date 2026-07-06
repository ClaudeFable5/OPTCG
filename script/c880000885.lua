-- AUTO-GENERATED: OP07-031 / 바르톨로메오
-- rules_id=OP07-031 script_id=880000885 fingerprint=74546f599817d93753e4e11b2bf4af5b9aecfe0162d6e3c5b6e833a7cf03481e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-031]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】캐릭터가 자신의 효과로 레스트 되었을 때, 카드를 1장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[ON_OWN_CHARACTER_RESTED_BY_EFFECT]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP07-031]],
    schema_version=1,
  })
end
