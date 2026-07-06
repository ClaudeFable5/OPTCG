-- AUTO-GENERATED: ST02-008 / 스크래치멘 아푸
-- rules_id=ST02-008 script_id=880001737 fingerprint=d8499c11e7405ea953f78f599a6291239c8ea9bbc727bd93d316f4631d77ca96
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST02-008]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[REST_DON]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!x1】【어택 시】상대의 두웅!!을 1장까지 레스트 한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST02-008]],
    schema_version=1,
  })
end
