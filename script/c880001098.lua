-- AUTO-GENERATED: OP09-003 / 샤치 & 펭귄
-- rules_id=OP09-003 script_id=880001098 fingerprint=fc97b7e5a1b890287c4774452fc936b3a8d95805326aad346f39f2baeef3ed3e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -2000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-003]],
    schema_version=1,
  })
end
