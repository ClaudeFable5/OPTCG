-- AUTO-GENERATED: OP09-062 / 니코 로빈
-- rules_id=OP09-062 script_id=880001158 fingerprint=bec3593c6aa17dcb751f0794ff33f99ecd40069dcc777c0132f12fad9945f0b7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-062]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              has_trigger=true,
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 패에서 【트리거】를 가진 카드를 1장 버릴 수 있다: 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={
      [[BANISH]],
    },
    rules_id=[[OP09-062]],
    schema_version=1,
  })
end
