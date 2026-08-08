-- MANUAL: OP16-001 / 포트거스 D. 에이스 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-001]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              filter={
                any={
                  { name=[[몽키 D. 루피]] },
                  { trait=[[흰 수염 해적단]] },
                },
                power_gte=8000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동 메인】【턴 1회】 자신의 파워 8000 이상인, 「몽키 D. 루피」나 『흰 수염 해적단』을 포함한 특징을 가진 캐릭터 1장까지는 이번 턴 동안 【속공】을 얻는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-001]],
    schema_version=1,
  })
end
