-- AUTO-GENERATED: OP14-005 / 킬러
-- rules_id=OP14-005 script_id=880002170 fingerprint=8a830c27df37d5dc4eea8ef077043b35936eabe3499f254e6c1788697874e235
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 리더 또는 캐릭터 1장에 레스트 상태인 두웅!! 1장까지를 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-005]],
    schema_version=1,
  })
end
