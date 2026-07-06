-- AUTO-GENERATED: EB01-044 / 펑크프리드
-- rules_id=EB01-044 script_id=880000043 fingerprint=9d73b5618b5f480b14a4f2821a70b8aa8828d37d65420e25a3d9a4342e34a8bc
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-044]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                name=[[스팬담]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 이번 턴 동안, 자신의 캐릭터인 「스팬담」 1장까지의 파워 +3000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-044]],
    schema_version=1,
  })
end
