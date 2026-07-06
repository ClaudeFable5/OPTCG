-- AUTO-GENERATED: OP13-017 / 몽키 D. 드래곤
-- rules_id=OP13-017 script_id=880001589 fingerprint=30c61abc1394247758e56b5129831980e296d6d52f483f473d9af8deb9da0e00
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-017]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                amount=-2000,
                duration=[[THIS_TURN]],
                op=[[MODIFY_OWN_POWER]],
                selector={
                  count=1,
                  kind=[[SELF]],
                  mode=[[EXACT]],
                  owner=[[YOU]],
                },
              },
            },
            selector={
              count=0,
              filter={
                trait=[[혁명군]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【턴 1회】자신의 《혁명군》 특징을 가진 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 이번 턴 동안, 이 캐릭터의 파워를 -2000 할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-017]],
    schema_version=1,
  })
end
